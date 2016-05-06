class NewAsistantForm
	include ActiveModel::Model
	include Virtus.model
	include Rails.application.routes.url_helpers

	attribute :code, Integer
	attribute :name, String
	attribute :carer, String
	attribute :codeEvent, Integer

	validates :code, :name, presence: true


	attr_accessor :asistant	


	def initialize(attrs = {}, asistant:nil)		
			self.asistant = Asistant.new 
			self.asistant.code = code
			self.asistant.name =  name			
			super(attrs)			
	end

	def save
		if valid?			 
			 self.asistant.code = code
				 self.asistant.name = name
		 	 self.asistant.carer = carer
				 self.asistant.codeEvent = codeEvent
				 self.asistant.save!
		else
			false
		end
	end

	def action
    	return asistant_path(asistant) if asistant.persisted?
    	asistant_path
	end
end