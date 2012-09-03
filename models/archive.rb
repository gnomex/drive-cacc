class Archive
  include Mongoid::Document
  include Mongoid::Timestamps

  field :filename, type: String
  field :description, type: String
  field :path, type: String
  field :filesize, type: Integer, default: 0
  field :year, type: Integer
  field :discipline, type: String
  field :teacher, type: String
  field :downloads, type: Integer, default: 0
  field :public, type: Boolean, default: false
  field :new, type: Boolean, default: true

  def name
    "#{filename} (#{year})"
  end

  def size_in_mb
    "%.2f" % (filesize/1024.0) + " MB"
  end

end