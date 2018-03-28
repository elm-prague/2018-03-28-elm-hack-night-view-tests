import React, { Component } from 'react';

import {
  Appear,
  BlockQuote,
  Cite,
  Code,
  CodePane,
  Deck,
  Heading,
  ListItem,
  List,
  Quote,
  Slide,
  S,
  Text,
  Image,
  Link,
  Layout,
  Fill,
  Fit,
} from 'spectacle';

import 'prismjs/components/prism-elm';

import createTheme from 'spectacle/lib/themes/default';

require('normalize.css');

const theme = createTheme(
  {
    primary: 'white',
    secondary: '#1F2022',
    tertiary: '#03A9FC',
    quarternary: '#CECECE',
  },
  {
    primary: 'Montserrat',
    secondary: 'Helvetica',
  },
);

const OldNew = ({ children, ...rest }) => (
  <Text textSize="0.6em" textAlign="left" {...rest}>
    {children}:
  </Text>
);

export default class Presentation extends Component {
  render() {
    return (
      <Deck
        transitionDuration={500}
        theme={theme}
        contentHeight="90%"
        contentWidth="90%"
      >
        <Slide>
          <Layout>
            <Heading size={1} textColor="secondary">
              Elm View Unit Tests
            </Heading>
          </Layout>
          <Text margin="40px 0 0" textAlign="left">
            Tomáš Horáček
            <br />
            horacek@cngroup.dk
          </Text>
        </Slide>
        <Slide transition={['fade']} bgColor="secondary" textColor="primary">
          <Heading size={1} textColor="primary">
            ?
          </Heading>
        </Slide>
        <Slide>
          <Heading size={1} textColor="secondary">
            View
          </Heading>
          <Heading size={3}>Distributed Version Control System</Heading>
          <CodePane
            lang="elm"
            theme="light"
            textSize={25}
            source={`-- Some/View.elm

view : Model -> Html Msg`}
          />
        </Slide>
        <Slide transition={['fade']} bgColor="secondary" textColor="primary">
          <Heading size={1} textColor="primary">
            ?
          </Heading>
        </Slide>
        <Slide transition={['fade']} bgColor="secondary" textColor="primary">
          <Heading size={1} textColor="primary">
            Thanks!
          </Heading>
        </Slide>
      </Deck>
    );
  }
}
