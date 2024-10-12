module Api
  module V1
    class AssertionsController < ApplicationController
      def index
        @assertions = Assertion.limit(10) # TODO: pagination
      end

      def create
        @assertion = Assertion.new(assertion_params)

        if @assertion.valid?(:setup) && @assertion.save
          render @assertion, status: :created
        else
          raise @assertion.errors.inspect # TODO: handle unsaved assertion
        end
      end

      private

      def assertion_params
        params.require(:assertion).permit(:url, :text)
      end
    end
  end
end
