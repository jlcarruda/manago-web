class BaseController < ApplicationController
	before_action :query, only: :index
	before_action :collection, only: :index
	before_action :object, only: [:show, :new]

	def index
	end

	def show
	end

	def new
	end

	def create
		if object.valid?
			@object.save!
			flash[:notice] = "Deck criado com sucesso"
			redirect_to controller: params[:controller], action: :show, id: @object.id
		end
	end

	def edit
	end

	def update
	end

	def delete
	end

	def destroy
	end

	private

	def query
		@q = model.ransack(params[:q])
		@qr = @q.result(distinct: true) if @q.present?
	end

	def object
		@object = params[:id].present? ? model.find(params[:id]) : model.new(object_params)
	end

	def collection
		@collection = query
	end

	def model
		Card
	end

	def object_params
		params.fetch(model.class_name.to_sym, {})
	end
end