import React, { useState } from "react";

export default function App() {
  const [size, setSize] = useState(0);
  const [square, setSquare] = useState([]);

  const handleDraw = () => {
    /* 여기에 로직을 구현 해주세요 */
    const newSquare = Array(size)
      .fill(null)
      .map(() => Array(size).fill("O"));

    for (let i = 0; i < size; i++) {
      newSquare[0][i] = "X";
      newSquare[size - 1][i] = "X";
      newSquare[i][0] = "X";
      newSquare[i][size - 1] = "X";
      newSquare[i][i] = "X";
      newSquare[i][size - 1 - i] = "X";
    }
    setSquare(newSquare);
  };

  return (
    <div className="App">
      <h1>Draw Square</h1>
      <div>
        Input Size:{" "}
        <input
          type="number"
          value={size || ""}
          onChange={(e) =>
            Number(e.target.value) > 0 && setSize(Number(e.target.value))
          }
        />
        <button onClick={handleDraw}>Go</button>
      </div>

      <div style={{ marginTop: "20px" }}>
        {square.map((row, i) => (
          <pre key={i}>{row.join(" ")}</pre>
        ))}
      </div>
    </div>
  );
}
