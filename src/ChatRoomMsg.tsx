import React from 'react';
import styled from 'styled-components';

const Wrapper = styled.div`
  flex: 10;
  background-color: #F39939;
`;
const ChatRoomMsg: React.FC = () => {
  return (
    <Wrapper>
      chat room message
    </Wrapper>
  );
}

export default ChatRoomMsg;
