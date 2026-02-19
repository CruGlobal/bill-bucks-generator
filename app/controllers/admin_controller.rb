class AdminController < ApplicationController
  def index
    @balances = Buck
      .select("LOWER(\"to\") AS name, SUM(CASE WHEN buck_type = 'vonette' THEN 5 ELSE 1 END) AS balance")
      .group("LOWER(\"to\")")
      .order("balance DESC")
  end
end
