import Ember from 'ember';
import config from './config/environment';

const Router = Ember.Router.extend({
  location: config.locationType
});

Router.map(function() {
  this.route('page', { path: 'page/:page_alias' });
  this.route('admin', function() {
    this.route('pages', function() {
      this.route('new');
      this.route('edit', { path: 'edit/:page_id'});
    });
    this.route('blog', function() {
      this.route('new');
      this.route('edit');
    });
    this.route('users', function() {
      this.route('edit', { path: 'edit/:user_id'});
      this.route('new');
    });
  });
  this.route('blog');
  this.route('login');
  this.route('install');
  this.route('loading');
  // this.route('error');
});

export default Router;
