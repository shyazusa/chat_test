import React from 'react';
import styled from 'styled-components';

const Wrapper = styled.div`
  flex: 1;
  background-color: #2743D2;
  padding: 0 10px 0 10px;
  display: flex;
  justify-content: center;
  align-items: center;
`;
type Props = {
  name: string;
}

const ChatRoomHeader: React.FC<Props> = (props: Props) => {
  return (
    <Wrapper>
      {props.name}
    </Wrapper>
  );
}

export default ChatRoomHeader;
