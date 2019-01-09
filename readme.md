## Reedsy's Ruby Assignment

### Hello, my name is [Behrang Mirzamani](http://behrang.studio)

I am a 33 years old person living in Tehran, Iran with my wife. I am a passionate person with ENTP personality type. A man interested in sports activities, very good in soccer, tennis and e-gaming( Legendary Eagle in CS:GO if you know what I mean ;) ). I love reading books both technical and non technical. My educations were not related to Computer Science when I became a programmer and have always thought learning by myself is the best way to learn. Very enthusiastic about what I do and highly competitive when  it comes to what I am passionate about.

I have been developing ruby on rails applications for the last 6 years and have learnt programming with ruby. I have experience being a fullstack developer in the early stages of my career with basic HTML, CSS and JS. But since I am always learning new technologies I have managed to learn React in the recent times. I have been in different companies from owning the product to being the main contributer for a project. For the last 2 years I have been in an International company building wide variety of applications and have been promoted to lead position due to my efforts. I have been involved in growth of few applications like RedSix, Migrate Live, Kanon Health ...

### Retrieve and Refresh Challenge; 

The challenge was to produce a simple activerecord, a factory for generating sample data, and to implement the retrieve method then thinking about how you might implement a refresh method.

Retrieving a book feed for an specific user could be implemented in few ways, the one I chose is to collect the needed data from upvotes and follows by collecting all the books of the upvoted book author and the books written by the favourite authors. then by sorting all the collected data with the count of the presented books.

Refreshing the feed I think would be a method which returns data for the new books and sorting them with the same logic as the feed but if I would want to add a logic to it, seems logical to define a model for marking books as 'seen' and exclude those in the data that will be returned from refresh method. For finding the new books which has been published after the last time a user retrieve the books feed we will need a flag on user data for the time that he has retrieved the feed.

For running an example of the feed all you have to do is to run `bundle install && bundle exec ruby ./rakefile.rb` from the command line.

### PaymentFactory

I wanna go with Strategy design pattern here, designing an interface for PayStrategy with three steps, 
first you validate or query the customer details second post the payment for processing and finally query the status of that transaction afterwards.


### Recommendation Engine

Recommending books to an specific user is data science related, when you look at recommendation engines used by google, netflix and other big companies you would think that recommendation is a hard challenge, and it is. But if you want to think about it you could go multiple ways.

One would be to take a look at gems from ruby community, the most popular rails recommendation gems, [predictor](https://github.com/Pathgather/predictor) and [recommendable](https://github.com/davidcelis/recommendable), both use Redis as their backing store.

Or you could use 3rd party integrations or online services for outsourcing the solution outside your main application, [Recombee](https://www.recombee.com/where-to-use.html) and [Tamber](https://tamber.com) might be good examples of those tools.

And last to demonstrate how the algorithm works without installing many other gems would be to implement a simple algorithm to generate a recommended books set. I found two options to go about it;

##### First, Collaborative filtering which I will implement
###### What is collaborative filtering?
* Let’s say Person A upvoted Book A, B, C
* There are other people who also upvoted Book A, B, C
* Those other people also upvoted other movies that Person A doesn’t know/hasn’t read
* Since Person A and other people share the same upvotes of Book A, B, C, chances are they have a very similar taste in books, so Person A may also want to know/read those other books other people liked
* You could make use of the Follow model by sorting the above result with books that are written by his/her favourite authors.
 
 Now that we have a basic understanding of how it works, here is how I will implement it;
 
* For every one other user, find the books both him/her and Person A upvoted
* Calculate the number of upvoted books Person A and him/her share. The more books Person A share with another user, the more weight we will put to his/her recommendation.
* The weight is calculated by dividing the total number of shared books by the total number of all books the other user upvoted. The reason we do in this way is that we can rule out the noise and edge cases, where a user may have simply upvoted all or almost all books for no reason. If we don’t do in this way, should the above case happen, it will recommend everything with too much of a weight and pollute our score.
* Associate each book with its own weight in a hash. When different users upvoted a same book, we accumulate the weight for that book. As you can see, the most recommended book will have the highest weight (recommendation rating)!
* Sort the hash by the weights in descending order and we are done!

##### Second, Item-Item Collaborative Filtering

First, we take each pair of books in our database and compute a similarity between the two books. To find this similarity, we compare the lists of users who upvoted the two books. If many people upvoted both of the books, chances are they’re fairly similar. Conversely, if not many people liked both books, they’re probably less similar.

Once we have this list of similarity scores between books, it’s pretty easy to provide recommendations. If a user is viewing a page for a specific book, we can provide a list of “Similar Books” by just finding the most similar books on our earlier metric. On a user’s homepage, we can just take all the books our user has upvoted, find the most similar books for each of them, and then aggregate those results together into one list.

##### The implementation has been done with the first method.
