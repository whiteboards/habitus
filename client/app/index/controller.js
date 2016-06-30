import Ember from 'ember';

export default Ember.Controller.extend({
    selectedPage: null,

    actions: {
      updateSelected: function(component, id, value) {
        console.log('value:', value);
        this.set('selectedPage', id);
      }
    }
});