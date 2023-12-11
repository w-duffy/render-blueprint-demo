import { useState, useEffect } from 'react';

function Counter() {
  const [count, setCount] = useState(0);

  useEffect(() => {
    // Set up an interval to increment the counter
    const interval = setInterval(() => {
      setCount((prevCount) => prevCount + 1);
    }, 1000);

    // Clean up the interval on component unmount
    return () => clearInterval(interval);
  }, []); // Empty dependency array means this effect runs once on mount

  return (
    <div>
      <h1>Counter: {count}</h1>
    </div>
  );
}

export default Counter;
