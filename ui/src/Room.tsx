import React, {useState} from 'react';
import styled from 'styled-components';

interface WrapperStyle {
  focus: boolean;
};
const Wrapper = styled.div<WrapperStyle>`
  height: 60px;
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding; 0 10px 0 10px;
  background-color: ${props => props.focus ? "white" : ""};
`;
type Props = {
  name: string;
  unreadCount: number;
}

const Room: React.FC<Props> = (props: Props) => {
  const [focus, setFocus] = useState(false);
  const {name, unreadCount} = props;
  let displayName = name;
  if (name.length >= 10) {
    displayName =
      name.substring(0, 10) + "...";
  }
  let displayUnreadCount = unreadCount + "";
  if (unreadCount === 0) {
    displayUnreadCount = "";
  }
  return (
    <Wrapper
      onMouseOver={() => setFocus(true)}
      onMouseOut={() => setFocus(false)}
      focus={focus}
    >
      <div>
        {displayName}
      </div>
      <div>
        {displayUnreadCount}
      </div>
    </Wrapper>
  );
}

export default Room;
