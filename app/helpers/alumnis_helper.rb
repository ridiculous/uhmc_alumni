module AlumnisHelper

  def remove_dups(alum)
    alum.inject([]) { |results, val| results << val unless results.include?(val); results }
  end

  def alumni_full_name
    if a = Alumni.find(@user.alumni_id)
      full_name ||= a.last_name+', '+a.first_name
      content_tag(:h2, full_name, :class => "assist")
    end
  end

  def edu_link(alum)
    _link_class = alum.schools.size > 0 ? "primary" : "expired"
    link_to('Education', alumni_schools_path(alum), :class => "btn #{_link_class}")
  end

  def job_link(alum)
    _link_class = alum.employments.size > 0 ? "info" : "warn"
    link_to('Job', alumni_employments_path(alum), :class => "btn #{_link_class}")
  end

  def link_to_employer(alum)
    jobs, job_id, job_employer = alum.employments.order("end_date"), '', ''
    unless jobs.empty?
      jobs.each { |job| job_id, job_employer = job.id, job.employer if job.work_present }
      unless job_employer.empty?
        msg = "View #{job_employer} employment details"
        link_to("#{job_employer}", alumni_employment_path(alum, job_id), :title => msg)
      else
        content_tag(:div, "Unemployed")
      end
    else
      content_tag(:div, "No record")
    end
  end

  def print_list
    states = state_list
    states.shift
    content_tag(:ul) { states.reduce('') { |result, values| result << content_tag(:li, values[0]) }.html_safe }
  end

  def maui_locations
    maui = {
        :central => "Central",
        :south => "South",
        :east => "East",
        :west => "West",
        :upcountry => "Upcountry",
        :molokai => "Molokai",
        :lanai => "Lanai",
        :other => "Other____"
    }
    loc = @alumni.location

    if !maui.keys.include?(loc) && !loc.nil?
      maui[loc.to_sym] = loc.capitalize
    end
    maui.invert
  end

  def list_ethnicity
    ethnics = {
        "American Indian/Alaska Native" => "American Indian/Alaska Native",
        "African American" => "African American",
        "Native Hawaiian" => "Native Hawaiian",
        "Other Pacific Islander" => "Other Pacific Islander",
        "Hispanic" => "Hispanic",
        "Asian" => "Asian",
        "White" => "White",
        "Other____" => "other"
    }
    eth = @alumni.ethnicity

    if !ethnics.keys.include?(eth) && !eth.nil?
      ethnics[eth.to_sym] = eth.capitalize
    end
    ethnics
  end

  def state_list
    states = {
        "" => "",
        :HI => "Hawaii",
        :AL => "Alabama",
        :AK => "Alaska",
        :AZ => "Arizona",
        :AR => "Arkansas",
        :CA => "California",
        :CO => "Colorado",
        :CT => "Connecticut",
        :DE => "Delaware",
        :FL => "Florida",
        :GA => "Georgia",
        :ID => "Idaho",
        :IL => "Illinois",
        :IN => "Indiana",
        :IA => "Iowa",
        :KS => "Kansas",
        :KY => "Kentucky",
        :LA => "Louisiana",
        :ME => "Maine",
        :MD => "Maryland",
        :MA => "Massachusetts",
        :MI => "Michigan",
        :MN => "Minnesota",
        :MS => "Mississippi",
        :MO => "Missouri",
        :MT => "Montana",
        :NE => "Nebraska",
        :NV => "Nevada",
        :NH => "New Hampshire",
        :NJ => "New Jersey",
        :NM => "New Mexico",
        :NY => "New York",
        :NC => "North Carolina",
        :ND => "North Dakota",
        :OH => "Ohio",
        :OK => "Oklahoma",
        :OR => "Oregon",
        :PA => "Pennsylvania",
        :RI => "Rhode Island",
        :SC => "South Carolina",
        :SD => "South Dakota",
        :TN => "Tennessee",
        :TX => "Texas",
        :UT => "Utah",
        :VT => "Vermont",
        :VA => "Virginia",
        :WA => "Washington",
        :WV => "West Virginia",
        :WI => "Wisconsin",
        :WY => "Wyoming"
    }
    states.invert
  end


end