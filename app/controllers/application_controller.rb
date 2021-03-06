class ApplicationController < ActionController::Base
  # TODO https://github.com/darkmatterapp/publisher-server-rails/issues/155
  SecureHeaders::Configuration.default do |config|
    config.csp = {
      default_src: %w['self'],
      img_src:     %w[* data:],
      media_src:   %w[*],
      script_src:  %w['self' http://platform.instagram.com],
      style_src:   %w['self' 'unsafe-inline'],
      frame_src:   %w[*],
      child_src:   %w[*]
    }
  end

  protect_from_forgery with: :exception
  before_action :ensure_domain

  before_action :append_to_content_security_policy_header

  before_action :set_slug
  before_action :set_owner
  before_action :set_page_links
  
  def ensure_domain
    unless request.env["HTTP_HOST"] == setting(:domain) || Rails.env.development?
      redirect_to site_url, status: 301
    end
  end
  
  def site_url
    setting(:protocol) + setting(:domain)
  end
  helper_method :site_url
  
  def append_to_content_security_policy_header
    append_content_security_policy_directives(
      default_src: [setting(:protocol).sub("//", "")],
      script_src:  [setting(:asset_host)],
      style_src:   [setting(:asset_host)],
    )
  end
  
  def setting(slug)
    Setting.find_by(slug: slug).try(:content)
  end
  helper_method :setting

  def set_owner
    @owner = User.first
  end

  def set_slug
    if @slug.blank?
      @slug = controller_name
    else
      @slug
    end
  end

  def set_page_links
    if signed_in?
      all_page_links = Post.of("Page").all
    else
      all_page_links = Post.of("Page").visible.all
    end

    @page_links = []
    all_page_links.each do |page|
      @page_links << page if page.post_type.show_in_nav?
    end
  end

  def allow_signup?
    User.count.zero?
  end
  helper_method :allow_signup?

  def add_private_tag(post_params, tag_params)
    tag_params += ", .private, " unless post_params["private"].to_i.zero?
    tag_params
  end

  def delete_tags(post)
    Tagging.where(post_id: post.id).destroy_all
  end

  def save_tags(post, post_params)
    delete_tags(post)
    add_private_tag(params[:tags], post_params)

    split_tags(params[:tags]).each do |name|
      tag = Tag.find_or_initialize_by(name: name)
      tag.save!

      Tagging.create!(post_id: post.post_type_id, tag_id: tag.id)
    end
  end

  def split_tags(tags)
    output = []
    tags = tags.gsub(/"|'/, ",")
    separator = tags.match(/,/) ? "," : " "

    tags.split(separator).each do |tag|
      t = tag.strip.gsub(/"|'/, "")
      output << t unless t.blank?
    end

    output.uniq
  end
  helper_method :split_tags

  private

  def signed_in?
    current_user
  end
  helper_method :signed_in?

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def authorize
    redirect_to signin_url, alert: "Not authorized" unless signed_in?
  end
end
