class Alumni < ActiveRecord::Base

  has_many :employments, :dependent => :delete_all
  has_many :schools, :dependent => :delete_all
  has_many :users, :dependent => :delete_all

  after_save :update_u_record
  before_save :time_updated_at, :other_fields

  validates :first_name, :last_name, :presence => true
  validates :zip_code, :secondary_zip_code, :numericality => true, :allow_blank => true
  validates_length_of :mi, :mi_grad, :maximum => 1
  validates :email,
            :presence => true,
            :format => {:with => /^[^@][\w.-]+@[\w.-]+[.][a-z]{2,4}$/i, :message => " must be the format of jdoe@domain.com"}

  scope :by_fullname, lambda { |op, f, l| where("alumnis.first_name #{op} ? and alumnis.last_name #{op} ?", f, l) }
  scope :by_name, lambda { |op, s| where("alumnis.first_name #{op} ? or alumnis.last_name #{op} ?", s, s) }
  scope :by_phone, lambda { |op, n| where("alumnis.home_phone #{op} ? or alumnis.cell_phone #{op} ? or alumnis.work_phone #{op} ?", n, n, n) }
  scope :by_program, lambda { |op, p| where("schools.program_name #{op} ?", p).joins(:schools) }
  #NOTE: If not using PostgreSQL, remove CAST()
  scope :by_address, lambda { |op, a| where("alumnis.mailing_address #{op} ? OR alumnis.mailing_address_2 #{op} ? OR alumnis.city #{op} ? OR alumnis.state #{op} ? OR alumnis.country #{op} ? OR CAST(alumnis.zip_code as varchar) #{op} ?", a, a, a, a, a, a) }
  scope :by_grad_date, lambda { |op, gd| where("to_char(schools.date_graduated,'Mon dd, YYYY') #{op} ?", gd).joins(:schools) }
  scope :by_email, lambda { |op, e| where("alumnis.email #{op} ?", e) }

  attr_accessor :other_ethnicity, :other_location


  #
  # +before_save+ Check if other ethnicity or location have values, and use them instead of those from the select list
  #

  def other_fields
    self.ethnicity = self.other_ethnicity if (self.ethnicity && self.ethnicity.eql?("other"))
    self.location = self.other_location if (self.location && self.location.eql?("other"))
  end

  #Modifications required for conversion of database from MySQL to PostgreSQL:
  #1. Change all LIKE string searches to ILIKE (case insensitive)
  #2. Use CAST on date & numeric data fields

  #Find search results
  def self.get_search_results(users_search, cat)
    if users_search
      op = "ILIKE" #PostgreSQL - case insensitive : MySQL
      users_search.strip!
      if cat.eql?("name")
        first_name, last_name = users_search.split(/\s/)
        last_name ? by_fullname(op, "%#{first_name.strip}%", "%#{last_name.strip}%") : by_name(op, "%#{users_search}%")
      elsif cat.eql?("phone")
        by_phone(op, "%#{users_search}%")
      elsif cat.eql?("program")
        by_program(op, "%#{users_search}%")
      elsif cat.eql?("address")
        by_address(op, "%#{users_search}%")
      elsif cat.eql?("graduation date")
        by_grad_date(op, "%#{users_search}%")
      else
        by_email(op, "%#{users_search}%")
      end
    else
      scoped
    end
  end

  def full_name
    self.last_name+', '+self.first_name
  end

  def self.setup_a_info(id)
    alum = find(id)
    alum.last_name+', '+alum.first_name
  end

  #( if user ) Update the alumni corresponding user record
  def update_u_record
    if u = users.first
      if u.role != 'admin'||'superuser'
        u.update_attribute(:first_name, self.first_name)
        u.update_attribute(:last_name, self.last_name)
        u.update_attribute(:email, self.email)
      end
    end
  end

  def self.for_user(users_id, id)
    begin
      u = User.find(users_id)
    rescue
      $!
    end
    # if not blank then alumni, else admin
    !u.alumni.blank? ? find(u.alumni_id) : find(id)
  end

  def self.sort_capable(sorted, sc, sd)
    if sorted.eql?("date_graduated")
      joins(:schools).order("substring(to_char(schools.date_graduated,'Mon dd, YYYY') from 8 for 5) " + sd)
    elsif sorted.eql?("program_name")
      joins(:schools).order("schools.program_name " + sd)
    else
      order(sc + " " + sd)
    end
  end

  def time_updated_at
    self.updated_at = DateTime.now
  end

end
