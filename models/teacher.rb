class Teacher
	include Mongoid::Document

	has_many :archives

	field :name, type: String
end