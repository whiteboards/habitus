import Ember from 'ember';

export default Ember.Component.extend({
  sortBy: ['insertedAt:desc'],
  sortedPosts: Ember.computed.sort('posts', 'sortBy'),
});
