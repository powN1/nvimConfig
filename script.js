import { Calculator } from "./calculator.js";
export default function multiplyByThree(num) {
	return num * 2;
}
const roundedNumber = Math.floor(2.34);
const tablica = [12, "tekst", true, 99];
const tablicaMultiplied = tablica.forEach(element => element * 3);
tablica.map(item => item);
multiplyByThree(24);

console.log("pierwotny");
// this is a comment!
const arrow = e => {
	const numb = 12;

	if (numb > 5) return;
};

const text =
	"Pewnego mrocznego, ciemnego dnia, wybrał się na polowanie                                 asdsd asd wad wa sad ";
const calulator = Calculator();

const obj = [
	1223, 123, 123, 123, 123, 123, 123, 123, 123, 123, 123, 123, 123, 123, 123, 123, 123, 123, 123, 123, 123, 123, 123,
	123, 123, 123, 123, 123, 123, 123,
];
let {
	blog: {
		_id,
		title,
		comments: { results: commentsArr },
		activity: { total_parent_comments },
	},
	commentsWrapper,
	setCommentsWrapper,
	totalParentCommentsLoaded,
	setToalParentCommentsLoaded,
} = useContext(BlogContext);

const myFunc = () => {
	return (
		<div>
			<div>
				<div>{obj ? 1 : 0}</div>
			</div>
		</div>
	);
};
