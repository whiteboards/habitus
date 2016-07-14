import Ember from 'ember';

export default Ember.Component.extend({
  deleted: Ember.computed('isDeleted', function () {
    if (this.get('isDeleted')) {return 'animated zoomOutDown'}
    return ''
  }), 
  createdAt: Ember.computed('content.{insertedAt}', function () {
    if (!this.get('content.insertedAt')) { return '' }
    let myDate = this.get('content.insertedAt')
    return myDate.toDateString() + ', ' + myDate.toLocaleTimeString()
  }),
  updatedAt: Ember.computed('content.{updatedAt}', function () {
    if (!this.get('content.updatedAt')) { return '' }
    let myDate = this.get('content.updatedAt')
    return myDate.toDateString() + ', ' + myDate.toLocaleTimeString()
  })
});
