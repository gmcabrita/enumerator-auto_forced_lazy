describe "Enumerator::Lazy#auto_force" do
  it "creates a wrap around Enumerator::Lazy" do
    expect(
      (1..10000)
        .lazy
        .take_while { |i| i < 50 }
        .force
        .length
    ).to eq(
      (1..10000)
        .lazy
        .auto_force
        .take_while { |i| i < 50 }
        .length
    )
  end
end
