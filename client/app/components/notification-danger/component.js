import Ember from 'ember';

export default Ember.Component.extend({
  classes: '',
  actions: {
    deleteMe() {
      this.set('classes', 'animated fadeOut')
      this.remove()
    } 
  }
});
