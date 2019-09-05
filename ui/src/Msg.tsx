import React from 'react';
import styled from 'styled-components';

interface WrapperStyle {
  mine: boolean;
}
const Wrapper = styled.div<WrapperStyle>`
  margin-top: 20px;
  padding: 5px 10px;
  min-width: 120px;
  max-width: 50%;
  background: #e0edff;
  border-radius: 10px;
  align-self: ${props => props.mine ? "flex-end" : "flex-start"};
`;
type Props = {
  content: string,
  mine: boolean,
};

const Msg: React.FC<Props> = (props: Props) => {
  const {mine, content} = props;
  return (
    <Wrapper mine={mine}>
      <div>{content}</div>
    </Wrapper>
  );
}

export default Msg;
