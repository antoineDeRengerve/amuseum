# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version 3.4.2

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

## How to run

* Clone project
* Configure project
```bash
bundle install
bin/rails db:setup
bin/rails db:migrate
bin/rails db:seed
```
* Run project: `bin/dev`
* Connect to **http://localhost:3000**





---- TO BE DELETED - PROBABLY ALREADY DOCUMENTED IN WIKI ----
To be added in project:

Choice frontend framework

Bootstrap - specific, a little old
Tailwindcss - specific, tends to have multiple diverging design, highly customisable
BEM - could work, require some effort to set up (use AI to do that). Basic HTML and JS after. Maybe harder to have complex components. AI can help (but: bugs? Tested?)
Shadcn/ui: require react, how yo integrate?
Easy deployment with Rails 8. In a dedicated VM. Avoid complexity of backend API with React. Avoid complexity of integration of React within Rails app (configuration?)
Inertiajs: simplify routing (BE and not front), no need to build secure API for that.
Superglue : similar to Inertiajs but focused on importing components within Rails rather than connect front end with backend framework.
Preferences:
Inertiajs: most appealing because clear boundary between what should be in React and what should be in Rails. Use with shadcnui for a lightweight components.

However: testing BEM and very basic HTML/CSS/JS with the help of AI. Comment by some influencer: AI is able to write a lot of code effortless. Need for framework will decrease as it will be easy to use vanilla stuff.
Question is: quality / maintenance:

Vanilla code generated by AI will require to be validated. Isolation/independence of the generated code -> easy to make evolve later? Easy to debug? Easy to review? Easy to test?
With some predefined components - advantage is that some edge case are already tackled by default. No need to reinvent the wheel.
Maybe with good examples, it is possible to rewrite the components? (Transcription Shadcn/ui to basic components?)
Check rails shadcn/ui in case needing some specific cases.
Rq: it is interesting to test the limits with a simple project and to compare rewriting this stuff with a light framework later.
