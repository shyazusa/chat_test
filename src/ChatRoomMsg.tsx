import React from 'react';
import styled from 'styled-components';
import Msg from './Msg';

const Wrapper = styled.div`
  flex: 10;
  background-color: #F39939;
  display: flex;
  flex-direction: column;
`;
type Msg = {
  id: number;
  content: string;
  userId: number;
};
type Props = {
  currentUserId: number;
  msgs: Array<Msg>;
};

const ChatRoomMsg: React.FC<Props> = (props: Props) => {
  const {msgs, currentUserId} = props;
  return (
    <Wrapper>
      {
        msgs.map(msg => (
          <Msg
            content={msg.content}
            mine={currentUserId === msg.userId}
          />
        ))
      }
    </Wrapper>
  );
}

export default ChatRoomMsg;
