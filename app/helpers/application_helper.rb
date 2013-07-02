module ApplicationHelper
	def label_for(attribute)
    t "activerecord.attributes.#{attribute}"
  end
end
