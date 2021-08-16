# yellow_movies

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


## Company instructions

Thank you for participating in Yellow Class's campus drive in 2022 for the position of Flutter Developer. In order to proceed ahead with the selection process, the first step is the assignment mentioned below- 


Build a simple application using Flutter compatible with Android/iOS devices.

- Build a simple aesthetic app to add/edit/delete/list movies that a user has watched.
- Show an infinite scrollable listview containing all the movies that a user has created.
- Implement a form to add a new movie or edit an existing one. (Fields to keep: Name, Director and a poster image of the movie)
- Each list item should have a delete icon to remove that movie from the list and an edit icon to allow edit on that movie.
- Store the data in either hive or sqflite local database.

Brownie points for integrating persistent google authentication using firebase and then allowing only logged-in users to add movies.


Deadline for the submission of assignment - Monday EOD (16th Aug 2021). For submission please share your assignment on this form - https://forms.gle/JSTd3jMGv44oZJgT8
(NOTE - Assignment submissions over email will not be acceptable.)

Wish you good luck!


## Design decisions


1. Infinite scrollable listview containing watched movie containers
2. Add to watch movie
3. IMDB search / custom for (Name, Director, poster upload)
4. fire auth
5. firebase to keep the list of watched movies
6. Store locally the metadata and movie list data for caching

 

 screens use components - movie list- movie item