class Archive
  include Mongoid::Document
  include Mongoid::Timestamps

  validates :name, :year, :teacher, :discipline, presence: true
  validates :year, numericality: { greater_than_or_equal_to: 2008 }
  validates :teacher, associated: true
  validates :discipline, associated: true

  field :name, type: String
  field :description, type: String
  field :path, type: String
  field :filesize, type: Integer, default: 0
  field :year, type: Integer
  field :downloads, type: Integer, default: 0
  field :public, type: Boolean, default: false
  field :new, type: Boolean, default: true

  belongs_to :discipline
  belongs_to :teacher

  def full_name
    "#{name} (#{year})"
  end

  def size_in_mb
    "%.2f" % (filesize/(1024.0*1024.0)) + " MB"
  end

  def file_type
    path.split(".").last
  end

  def snake_case
    name.gsub(/(.)([A-Z])/,'\1_\2').downcase!
  end

end