# frozen_string_literal: true

class ViewingPartyUser < ApplicationRecord
  belongs_to :user
  belongs_to :viewing_party
end
