import Ember from 'ember';

export default Ember.Component.extend({
  deleted: Ember.computed('isDeleted', function () {
    if (this.get('isDeleted')) {return 'animated zoomOutDown'}
    return ''
  }), 
});
