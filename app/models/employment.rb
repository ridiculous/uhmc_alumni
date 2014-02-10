class Employment < ActiveRecord::Base

  belongs_to :alumni

  before_save :alumni_record_updated

  validates :employer, :position_held, :alumni_id, :presence => true
  validates :work_zip_code, :numericality => true, :allow_blank => true
  validates_length_of :job_description,:job_details, :maximum => 3000

  default_scope order("employments.end_date DESC")
  def self.is_correct_request(user_alumni_id, id)
    record_found = where("alumni_id = ? and id = ?", user_alumni_id, id).first
    find(id) if record_found
  end

  def alumni_record_updated
    a = Alumni.find(self.alumni_id)
    a.update_attribute( :updated_at, DateTime.now )
  end

end
