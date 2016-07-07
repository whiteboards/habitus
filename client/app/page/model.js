import Model from 'ember-data/model';
import attr from 'ember-data/attr';
import { belongsTo, hasMany } from 'ember-data/relationships';
import marked from 'npm:marked'

export default Model.extend({
  title: attr('string'),
  content: attr('string'),
  userId: belongsTo('user'),
  insertedAt: attr('date'),
  updatedAt: attr('date'),
  comments: hasMany('comments'),
  tags: hasMany('tags'),
  alias: attr('string'),
  renderedContent: Ember.computed('content', function () {
    console.log('model:', this.get('content'))
    if (this.get('content') === undefined) {return ''}
    return marked(this.get('content'))
  }), 
});
