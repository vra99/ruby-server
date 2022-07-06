
class AuctionsController < ApplicationController
    protect_from_forgery with: :null_session
    def index
        file_data = params[:file]

        if file_data
            file= file_data.read

            @file_data = file.split("\n")

            @file_data.map! do |row|
                row.split("|")
            end
            
            @auctions= []

            @file_data.each do |row|
                if row[3] == "SELL"
                    winning_bid = "No valid bids"
                    winner_id = "No valid bids"

                    @file_data.each do |row2|

                        if row[2] == row2[2] && row2[3] == "BUY"

                            if row[0] < row2[0] #compare dates
                                winning_bid = row2[2] 
                                if row2[4].to_i > winning_bid.to_i #compare bids
                                    winner_id = row2[1]
                                    winning_bid = row2[4]
                                end
                            end
                        end
                    end

                    @auctions.push({
                        name: row[4],
                        item_id: row[2],
                        seller_id: row[1],
                        winner_id: winner_id,
                        winning_bid: winning_bid,
                    })
                end
            end

        else
            render json: {error: "No file uploaded"}
        end
    end
end