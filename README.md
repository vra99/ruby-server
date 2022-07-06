## The problem

We're running an auction house. Our legacy system generates a text file
containing all the auctions and bids in the system.

You need to create a Rails app that processes this file and returns a list of
auctions, each with user ID of the winner and the winning bid. How you display
this on screen is up to you.

```cucumber
Given I am a user of the site
And I have navigated to the root page
When I upload an auctions file
Then I should see a list of auctions, each with:
 - the name of the item
 - the ID of the item
 - the user ID of the seller
 - the user ID of the winner
 - the amount of the winning bid
```

## The bids file

The file containing the list of bids and listings is formatted as follows.

Each line is a series of fields, separated by the pipe character (`|`). The
list of fields is as follows:

* date as UNIX epoch (integer)
* user ID of bidder or seller (integer)
* ID of item (integer) - either the item being bid on if the row is a bid, or
  of the item being listed if the row is a listing
* action - either 'BUY' or 'SELL' depending on whether the row is a bid or a listing
* if the row is a bid (i.e. action is 'BUY'), the price of the bid
* if the row is an auction listing (i.e. action is 'SELL'), the name of the item

Example item listing:
```
1627305213|11111111|2222222|SELL|toaster
```

Example bid:
```
1627305548|33333|2222222|BUY|25.10
```

## The task

Create a Rails app that implements an endpoint and a view that will let a user
upload the included `auction-input.txt` file and return a list of auctions.
Assume that all auctions have ended.

Provide instructions for how to run your code.

Notes:

* invalid bids (e.g. on items that do not exist) should be discarded
* bids made before a listing began should be discarded
* if a user makes multiple bids on the same item, only the highest bid counts
* the rows in the file are not necessarily in chronological order

