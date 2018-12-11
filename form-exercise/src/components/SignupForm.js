import React, { Component } from 'react';
import './SignupForm.css';
import PropTypes from 'prop-types';

class SignupForm extends Component {

  constructor() {
    super();

    this.state = {
      firstName: '',
      lastName: '',
      email: '',
      password: ''
    }
  }

  onFirstNameChangeHandler = (e) => {
  this.setState({
    firstName: e.target.value
  })
}

onLastNameChangeHandler = (e) => {
  this.setState({
    lastName: e.target.value
  })
}

onEmailChangeHandler = (e) => {
  this.setState({
    email: e.target.value
  })
}

onPasswordChangeHandler = (e) => {
  this.setState({
    password: e.target.value
  })
}

onSubmitHandler = (e) => {
  e.preventDefault();

  const newAccount = {
    firstName: this.state.firstName,
    lastName: this.state.lastName,
    email: this.state.email,
    password: this.state.password
  }

  this.props.onCreateAccountCallback(newAccount);

  this.setState({
    name: '',
    lastName: '',
    email: '',
    present: false
  })
}


  render() {
    return (
      <form className="signup-form"
            name ="signup-form"
            id= "signup-form"
            onSubmit={this.onSubmitHandler}
          >
            <div>
              <label htmlFor="firstName">First name</label>
              <input
                name ="firstName"
                id= "firstName"
                value={this.state.firstName}
                onChange={this.onFirstNameChangeHandler} />
            </div>
            <div>
              <label htmlFor="lastName">Last Name</label>
              <input
              name ="lastName"
              id= "lastName"
                value={this.state.lastName}
                onChange={this.onLastNameChangeHandler} />
            </div>
            <div>
              <label htmlFor="email">Email</label>
              <input
                name="email"
                id="email"
                value={this.state.email}
                onChange={this.onEmailChangeHandler} />
            </div>
            <div>
              <label htmlFor="password">Password</label>
              <input
                name="password"
                id="password"
                onChange={this.onPasswordChangeHandler} />
            </div>
            <input
              type="submit"
              id="submit-form"
              value="Create account" />
          </form>
    )
  }
}

SignupForm.propTypes = {
  onCreateAccountCallback: PropTypes.func.isRequired,
}

export default SignupForm;
