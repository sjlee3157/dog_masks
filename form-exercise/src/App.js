import React, { Component } from 'react';
import './App.css';
import SignupForm from './components/SignupForm.js';

class App extends Component {

  onCreateAccount = (newAccount) => {
    console.log(newAccount)
  }

  render() {
    return (
      <div className="App">
        <main>
        Account Signup!
          <section>
            <SignupForm
              onCreateAccountCallback={ this.onCreateAccount }/>
          </section>
        </main>
      </div>
    );
  }
}

export default App;
