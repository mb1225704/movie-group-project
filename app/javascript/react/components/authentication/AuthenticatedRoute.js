import React from "react";
import { Route } from "react-router";


const AuthenticationCheck = ({ component: Component, user }) => {
  debugger
  if (user !== null) {
    return <Component user={user} />;
  }
  // return <Redirect to="/user-sessions/new" />;
  window.location.pathname("/users/sign_in")
};

const AuthenticatedRoute = ({ component, user, ...rest }) => {
  debugger
  return (
    <Route
      // eslint-disable-next-line react/jsx-props-no-spreading
      {...rest}
    >
      <AuthenticationCheck user={user} component={component} />
    </Route>
  );
};
export default AuthenticatedRoute;