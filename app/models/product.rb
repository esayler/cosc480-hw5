class Product < ActiveRecord::Base

  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/noimg.png"

  validates_attachment :image, :content_type => {:content_type => ["image/jpeg", "image/png", "image/gif"]}

  def age_range
    age_lo = self.minimum_age_appropriate
    age_hi = self.maximum_age_appropriate

    # assume that if age_hi is non-nil, age_lo is also non-nil
    if age_hi
      if age_lo == age_hi
        "Age #{age_lo}"
      else
        "#{age_lo} to #{age_hi}"
      end
    else
      if age_lo
        "#{age_lo} and above"
      else
        "0 and above"
      end
    end
  end

  def age_appropriate?(age)
    age_lo = self.minimum_age_appropriate
    age_hi = self.maximum_age_appropriate

    # assume that if age_hi is non-nil, age_lo is also non-nil
    if age_hi
      (age_lo..age_hi).include?(age)
    elsif age_lo
      age < age_lo ? false : true
    else
      # urn true if neither min/max are set
      true
    end
  end

  def self.sorted_by(field)
    query = Product.column_names.include?(field) ? field : "name"
    Product.order(query)
  end

end
