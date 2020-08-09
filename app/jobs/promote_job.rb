class PromoteJob < ApplicationJob
	include SuckerPunch::Job
	
  def perform(record, name, file_data)
    attacher = Shrine::Attacher.retrieve(model: record, name: name, file: file_data)
    attacher.create_derivatives(:thumbnails) # call the processor
    attacher.atomic_promote
  end
end