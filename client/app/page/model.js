import Model from 'ember-data/model';
import attr from 'ember-data/attr';
import { hasMany } from 'ember-data/relationships';
import marked from 'npm:marked'

export default Model.extend({
  title: attr('string'),
  content: attr('string'),
  insertedAt: attr('date'),
  updatedAt: attr('date'),
  enableComments: attr(),
  comments: hasMany('comments'),
  tags: hasMany('tags'),
  alias: attr('string'),
  renderedContent: Ember.computed('content', function () {
    if (this.get('content') === undefined) {return ''}
    return marked(this.get('content'))
  }), 
});
