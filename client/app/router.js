import Ember from 'ember';
import config from './config/environment';

const Router = Ember.Router.extend({
  location: config.locationType
});

Router.map(function() {
  this.route('page');
  this.route('admin', function() {
    this.route('pages', function() {
      this.route('new');
      this.route('edit');
    });
    this.route('blog');
    this.route('users');
  });
  this.route('blog');
  this.route('login');
  this.route('install');
});

export default Router;
