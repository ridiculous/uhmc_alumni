module SchoolsHelper

  def update_listings

    updated_campuses
    updated_degrees
    updated_programs

  end

  def other_field(div_id)
    content_tag(:div, :id => div_id) do
      content_tag(:div, "Type in your #{div_id.sub('other_','')} name")+
        text_field(:school, div_id )+" or "+
        content_tag(:span,"cancel", :id => "_cancel", :class => "clickhere")
    end
  end

  def not_listed(field)
    content_tag(:div, :style => "font-size:13px;") do
      content_tag(:span, "#{field.capitalize} not listed? ")+
        content_tag(:span, "Click here", :id => ("_"+field), :class => "clickhere")
    end
  end

  def degree_options
    updated_degrees.invert #have to invert it in order to get right format
  end

  def program_options
    updated_programs.collect{ |p| [ p, p ]} #Create two dimensional array
  end

  def campus_options
    updated_campuses.collect{ |c| [ c, c ]} #Create two dimensional array
  end

  CAMPUSES = [
    "UH Maui College",
    "UH Hilo",
    "UH Manoa",
    "UH West Oahu",
    "Hawaii CC",
    "Honolulu CC",
    "Kaui CC",
    "Kapiolani CC",
    "Leeward CC",
    "Windward CC"
  ]

  DEGREES = {
    "" => "",
    :AA =>	"Associate of Arts (AA)",
    :AAS =>	"Associate of Applied Science (AAS)",
    :AS	=> "Associate in Science (AS)",
    :ASC =>	"Academic Subject Certificate (ASC)",
    :ATS	=> "Associate in Technical Studies (ATS)",
    :BAS =>	"Bachelors of Applied Science (BAS)",
    :CO	=> "Certificate of Competence (CO)",
    :CC =>	"Certificate of Completion (CC)",
    :CA =>	"Certificate of Achievement (CA)",
    :MA => "Master of Arts (MA)",
    :MS => "Master of Science (MS)",
    :PhD => "Doctor of Philosophy (Ph.D.)",
    :SD => "Doctor of Science (S.D.)"
  }

  PROGRAMS = [
    "",
    "Accounting",
    "Administration of Justice",
    "Agriculture and Natural Resources",
    "Allied Health",
    "Applied Business and Information Technology",
    "Auto Body Repair and Painting",
    "Automotive Technology",
    "Baking",
    "Business Careers",
    "Business Technology",
    "Culinary Arts",
    "Cultural and Natural Resource Management",
    "Dental Assisting",
    "Dental Hygiene",
    "Early Childhood Specialization",
    "Electronic and Computer Engineering Technology",
    "Engineering Technology",
    "Fashion Technology",
    "Floriculture and Landscape Maintenance",
    "Horticulture and Landscape Maintenance",
    "Hospitality and Tourism",
    "Human Services",
    "Information Processing Specialty",
    "Liberal Arts",
    "Legal Office Specialty",
    "Medical Assistant I",
    "Medical Assistant II",
    "Nursery Management",
    "Practical Nurse",
    "Registered Nurse",
    "Restaurant Supervision",
    "Substance Abuse Counseling",
    "Sustainable Tropical Crop Management"
  ]


  protected

  def updated_degrees
    degree = @school.degree_name
    keyz,vals = [],[]
    tmp_degrees = DEGREES.dup
    unless degree.nil?
      tmp_degrees.select do |k, v|
        keyz << k.to_s
        vals << v.to_s
      end
      tmp_degrees.store(degree,degree) unless (keyz.include?(degree) || vals.include?(degree))
    end
    tmp_degrees
  end
  
  def updated_programs
    pro = @school.program_name
    tmp_programs = PROGRAMS.dup
    if ! tmp_programs.include?(pro) && ! pro.nil?
      tmp_programs << pro
    end
    tmp_programs
  end

  def updated_campuses
    camp = @school.school_name
    tmp_campuses = CAMPUSES.dup
    if ! tmp_campuses.include?(camp) && ! camp.nil?
      tmp_campuses << camp
    end
    tmp_campuses
  end


end
