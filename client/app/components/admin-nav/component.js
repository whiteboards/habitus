import Ember from 'ember';

export default Ember.Component.extend({
  isExpanded: false,
  actions: {
    expandMenu() {
      this.toggleProperty('isExpanded')
    }
  }
});
