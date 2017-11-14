import React from 'react';
import ReactDOM from 'react-dom';
import { Provider } from 'react-redux';
import App from '../components/app';

const Root = ( {store} ) => (
	<Provider store={store}>
		<div>
			<App />
			<h1> hello!</h1>
		</div>
	</Provider>
);

export default Root;
