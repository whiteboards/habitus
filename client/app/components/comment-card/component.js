import Ember from 'ember';

export default Ember.Component.extend({
  updatedAt: Ember.computed('comment.{insertedAt}', function () {
    if (!this.get('comment.insertedAt')) { return '' }
    let myDate = this.get('comment.insertedAt')
    return myDate.toDateString() + ', ' + myDate.toLocaleTimeString()
  })
});
