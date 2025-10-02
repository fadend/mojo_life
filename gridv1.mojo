import random

@fieldwise_init
struct Grid(Copyable, Movable, Stringable):
    var rows: Int
    var cols: Int
    var data: List[List[Int]]

    @staticmethod
    fn random(rows: Int, cols: Int) -> Self:
        random.seed()
        var data = List[List[Int]](capacity=rows)
        for _ in range(rows):
            row = List[Int](capacity=cols)
            for _ in range(cols):
                row.append(Int(random.random_si64(0, 1)))
            data.append(row^)
        return Self(rows, cols, data^)

    fn evolve(self) -> Self:
        var next_generation = List[List[Int]](capacity=self.rows)
        for i in range(self.rows):
            var row = List[Int](capacity=self.cols)
            for j in range(self.cols):
                var neighbors = 0
                for i_offset in [-1, 0, 1]:
                    for j_offset in [-1, 0, 1]:
                        if i_offset == 0 and j_offset == 0:
                            continue
                        neighbors += self[(i + i_offset) % self.rows, (j + j_offset) % self.cols]
                new_state = 0
                if neighbors == 3 or (self[i, j] > 0 and neighbors == 2):
                    new_state = 1
                row.append(new_state)
            next_generation.append(row^)
        return Self(self.rows, self.cols, next_generation^)

    fn __getitem__(self, row: Int, col: Int) -> Int:
        return self.data[row][col]

    fn __setitem__(mut self, row: Int, col: Int, new_value: Int) -> None:
        self.data[row][col] = new_value

    fn __str__(self) -> String:
        str_rows = List[String](capacity=self.rows)
        for row in self.data:
            str_row = List[String](capacity=self.cols)
            for cell in row:
                str_row.append("*" if cell > 0 else " ")
            str_rows.append("".join(str_row))
        return "\n".join(str_rows)