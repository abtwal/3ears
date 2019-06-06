import React from 'react';
import { render } from 'react-dom';
import * as serviceWorker from './serviceWorker'; // do we need it?
import { BrowserRouter as Router, Route, Link } from "react-router-dom";

import MediaItem from './media-item';
import MediaItems from './media-items';

const App = (
  <Router>
    <div>
      <nav>
        <ul>
          <li>
            <Link to="/">Home</Link>
          </li>
          <li>
            <Link to="/media/1">Media Item</Link>
          </li>
        </ul>
      </nav>

      <Route path="/" exact component={MediaItems} />
      <Route path="/media/:id" component={MediaItem} />
    </div>
  </Router>
);

render(App, document.getElementById('root'));

// If you want your app to work offline and load faster, you can change
// unregister() to register() below. Note this comes with some pitfalls.
// Learn more about service workers: https://bit.ly/CRA-PWA
serviceWorker.unregister();
