class ClickBaitValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value =~ /won't believe|secret|top \d|guess/i
      record.errors[attribute] << (options[:message] || "is not an clickbait-y enough.")
    end
  end
end

class Post < ActiveRecord::Base
  validates :title, presence: true, click_bait: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
end
