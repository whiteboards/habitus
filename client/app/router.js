import Ember from 'ember';
import config from './config/environment';

const Router = Ember.Router.extend({
  location: config.locationType
});

Router.map(function() {
  this.route('page', { path: '/page/:page_id' });
  this.route('admin', function() {
    this.route('pages', function() {
      this.route('new');
      this.route('edit');
    });
    this.route('blog');
    this.route('users', function() {
      this.route('edit');
      this.route('new');
    });
  });
  this.route('blog');
  this.route('login');
  this.route('install');
  this.route('loading');
  this.route('error');
});

export default Router;
