import React from 'react';
import styled from 'styled-components';
import Room from './Room';

const Wrapper = styled.div`
  flex: 1;
  background-color: #f2d3d3;
`;

const rooms = [
  {
    id: 1,
    name: "哲学科",
    unreadCount: 0,
  },
  {
    id: 2,
    name: "テクニカル",
    unreadCount: 10,
  },
  {
    id: 3,
    name: "アイドルマスター",
    unreadCount: 100,
  },
  {
    id: 4,
    name: "寿限無寿限無五劫の擦り切れ海砂利水魚の水行末雲来末風来末食う寝る処に住む処やぶら小路の藪柑子パイポパイポパイポのシューリンガンシューリンガンのグーリンダイグーリンダイのポンポコピーのポンポコナーの長久命の長助",
    unreadCount: 1000,
  },
]

const Rooms: React.FC = () => {
  return (
    <Wrapper>
      {
        rooms.map(room => (
          <Room
            name={room.name}
            unreadCount={room.unreadCount}
          />
        ))
      }
    </Wrapper>
  );
}

export default Rooms;
