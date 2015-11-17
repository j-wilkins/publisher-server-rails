class PostForm
  include ActiveModel::Model
  POST_COLUMNS = [:title,
                  :subtitle,
                  :content,
                  :slug,
                  :in_reply_to,
                  :private,
                  :published_at,
                  :tags]
  attr_accessor :klass,
                :post,
                :post_type

  delegate      :title,
                :subtitle,
                :content,
                :slug,
                :in_reply_to,
                :private,
                :published_at,
                :post_type_id,
                :post_type_type,
                to: :post,
                allow_nil: true


  def initialize(klass, post=nil)
    @klass     = klass
    @columns   = klass.columns.map(&:name)
    @post      = post || Post.new
    @post_type = self.post.post_type || klass.new
    define_attr_accessor(@columns)
    @columns.each do |col|
      self.send("#{col}=", @post_type.send(col))
    end
  end

  def model_name
    ActiveModel::Name.new(self, nil, @klass.to_s)
  end

  def persisted?
    @post.persisted?
  end

  def tags
    post.tags
  end

  def submit(params)
    params.delete(:slug) if params[:slug].blank?
    @post = Post.new(params.permit(self.class::POST_COLUMNS))
    @post_type = @klass.new(params.permit(@columns))
    @post_type.post = @post
    @post.post_type = @post_type
    @post.slug = @post_type.generate_slug unless @post.slug.present?
    if @post.valid? && @post_type.valid?
      @post.save! && @post_type.save!
    end
  end

  def update(params)
    post.attributes = params.permit(self.class::POST_COLUMNS)
    post.post_type.attributes = params.permit(@columns)
    if post.valid? && post.post_type.valid?
      post.save! && post.post_type.save!
    end
  end

  def path
    @post.path
  end

  private

  def define_attr_accessor(columns)
    self.class.class_eval do
      columns.each do |col|
        attr_accessor col.to_sym
      end
    end
  end

end
