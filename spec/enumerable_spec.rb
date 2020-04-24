describe "Enumerable#auto_forced_lazy" do
  it "wraps Enumerator::Lazy and auto forces" do
    expect(
      (1..10000)
        .lazy
        .take_while { |i| i < 50 }
        .force
        .length
    ).to eq(
      (1..10000)
        .auto_forced_lazy
        .take_while { |i| i < 50 }
        .length
    )
  end
end
