**Gentelella On Rails**
---------------------------
Rails 4 implementation of the awesome [Gentelella](https://github.com/puikinsh/gentelella) Bootstrap admin template.

- ruby 2.2.3
- Gentelella 1.1.0

Setup:
 1. Clone this repo :  git clone
    https://github.com/iogbole/gentelella_on_rails.git

 2. cd gentelella_on_rails

 3. npm install -g bower

 4. bower install

 5. bundle install

 6. rails s

That's it!

Navigate to   http://localhost:3000

![gentelella on rails ](https://cloud.githubusercontent.com/assets/2548160/16155032/63da00fa-34a5-11e6-917e-f7a616d7bd50.png)

------------------------------------------------------------------------
If you're using devise, you'd need to create another layout to handle authentication and sign_ups as discussed in [issue #2](https://github.com/iogbole/gentelella_on_rails/issues/2).

This is the [login template](https://gist.github.com/iogbole/a2f1ddf330cb5194967a1996369619e8). And this is what it looks like:

 ![enter image description here](https://cloud.githubusercontent.com/assets/2548160/14933076/fb9724d2-0e7a-11e6-8e3a-26c352576d07.png)

----------
*I committed the vendor files to this repo so you may skip step 3 and 4*

**Contributing**

In the spirit of [free software](http://www.fsf.org/licensing/essays/free-sw.html), everyone is encouraged to help improve this project. Here are a few ways you can pitch in:

 - Report bugs or issues
 - Fix bugs and submit pull requests.
 - Write, clarify or fix documentation.
 - Refactor code.
