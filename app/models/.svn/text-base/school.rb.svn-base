class School < ActiveRecord::Base

  belongs_to  :alumni
  has_one     :alumni
  before_save :alumni_record_updated, :check_if_present

  attr_accessor :other_program, :other_degree, :other_school

  validates :school_name, :presence => true, :if => :other_school_absent
  validates_length_of :internships, :projects, :maximum => 3000
  # validates :degree_name, :presence => true, :if => :other_degree_absent
  # validates :program_name, :presence => true, :if => :other_program_absent

  default_scope order("schools.date_graduated DESC")

  def alumni_record_updated
    a = Alumni.find(self.alumni_id)
    a.update_attribute( :updated_at, DateTime.now )
  end

  def check_if_present
    self.program_name = self.other_program unless self.other_program.strip.empty?
    self.degree_name = self.other_degree unless self.other_degree.strip.empty?
    self.school_name = self.other_school unless self.other_school.strip.empty?
  end

  def other_program_absent
    self.other_program.empty?
  end

  def other_degree_absent
    self.other_degree.empty?
  end

  def other_school_absent
    self.other_school.nil?
  end
end
