import React from 'react';
import styled from 'styled-components';
import Header from './Header';

const Main = styled.div`
  height: calc(100vh - 50px);
`;
const App: React.FC = () => {
  return (
    <div>
      <Header />
      <Main>
      </Main>
    </div>
  );
}

export default App;
